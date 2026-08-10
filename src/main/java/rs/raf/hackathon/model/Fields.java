package rs.raf.hackathon.model;

final class Fields {

    private Fields() {
    }

    static String required(String value, String field) {
        if (value == null || value.isBlank()) {
            throw new IllegalArgumentException("Missing " + field);
        }
        return value.trim();
    }

    static String optional(String value) {
        return value == null ? "" : value.trim();
    }
}
