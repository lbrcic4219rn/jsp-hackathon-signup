package rs.raf.hackathon.store;

import rs.raf.hackathon.model.Team;
import rs.raf.hackathon.model.TeamMember;

import java.io.IOException;
import java.io.Writer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;

public record ApplicationStore(Path directory) {

    private static final String SEPARATOR = "*===============================================*";

    public static ApplicationStore fromEnvironment() {
        String configured = System.getProperty("hackathon.data.dir");
        if (configured == null || configured.isBlank()) {
            configured = System.getenv("HACKATHON_DATA_DIR");
        }
        Path dir = (configured == null || configured.isBlank())
                ? Path.of(System.getProperty("java.io.tmpdir"), "hackathon-applications")
                : Path.of(configured);
        return new ApplicationStore(dir);
    }

    public static String fileNameStem(String teamName) {
        String slug = teamName.toLowerCase()
                .replaceAll("[^a-z0-9]+", "-")
                .replaceAll("(^-+)|(-+$)", "");
        if (slug.isEmpty()) {
            slug = "team";
        }
        return slug.length() > 60 ? slug.substring(0, 60) : slug;
    }

    public void save(Team team) throws IOException {
        Files.createDirectories(directory);
        Path file = directory.resolve("team_" + fileNameStem(team.getName()) + ".txt");
        try (Writer writer = Files.newBufferedWriter(file, StandardCharsets.UTF_8)) {
            line(writer, "Team name: " + team.getName());
            line(writer, "Contact email: " + team.getContactEmail());
            line(writer, "Contact phone: " + team.getContactPhone());
            line(writer, "Team motto: " + team.getMotto());
            line(writer, "Heard about the hackathon via: " + team.getReferral());
            line(writer, "Number of members: " + team.getSize());
            line(writer, SEPARATOR);

            int index = 1;
            for (TeamMember member : team.getMembers()) {
                line(writer, "Member " + index++ + ": " + member.getFullName());
                line(writer, "Member email: " + member.email());
                line(writer, "Role: " + member.role());
                line(writer, "LinkedIn: " + member.linkedIn());
                line(writer, SEPARATOR);
            }
        }
    }

    private static void line(Writer writer, String text) throws IOException {
        writer.write(text);
        writer.write(System.lineSeparator());
    }
}
