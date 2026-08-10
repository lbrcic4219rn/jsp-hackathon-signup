package rs.raf.hackathon.model;

import lombok.Getter;

import java.io.Serializable;
import java.util.List;

@Getter
public final class Team implements Serializable {

    public static final int MIN_SIZE = 3;
    public static final int MAX_SIZE = 4;

    private final String name;
    private final String contactEmail;
    private final String contactPhone;
    private final String motto;
    private final String referral;
    private final int size;
    private final List<TeamMember> members;

    public Team(String name, String contactEmail, String contactPhone, String motto, String referral, int size) {
        this(name, contactEmail, contactPhone, motto, referral, size, List.of());
    }

    private Team(String name, String contactEmail, String contactPhone, String motto, String referral,
                 int size, List<TeamMember> members) {
        this.name = Fields.required(name, "team name");
        this.contactEmail = Fields.required(contactEmail, "contact email");
        this.contactPhone = Fields.required(contactPhone, "contact phone");
        this.motto = Fields.optional(motto);
        this.referral = Fields.optional(referral);
        this.size = validSize(size);
        this.members = List.copyOf(members);
    }

    public static int validSize(int size) {
        if (size < MIN_SIZE || size > MAX_SIZE) {
            throw new IllegalArgumentException("Team size must be between " + MIN_SIZE + " and " + MAX_SIZE);
        }
        return size;
    }

    public static int parseSize(String raw) {
        try {
            return validSize(Integer.parseInt(raw == null ? "" : raw.trim()));
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Team size is not a number: " + raw);
        }
    }

    public Team withMembers(List<TeamMember> newMembers) {
        if (newMembers.size() != size) {
            throw new IllegalArgumentException("Expected " + size + " members, got " + newMembers.size());
        }
        return new Team(name, contactEmail, contactPhone, motto, referral, size, newMembers);
    }

}
