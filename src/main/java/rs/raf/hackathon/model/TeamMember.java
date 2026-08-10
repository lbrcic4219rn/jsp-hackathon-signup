package rs.raf.hackathon.model;

import java.io.Serializable;

public record TeamMember(String firstName, String lastName, String email, String role,
                         String linkedIn) implements Serializable {

    public TeamMember(String firstName, String lastName, String email, String role, String linkedIn) {
        this.firstName = Fields.required(firstName, "first name");
        this.lastName = Fields.required(lastName, "last name");
        this.email = Fields.required(email, "email");
        this.role = Fields.required(role, "role");
        this.linkedIn = Fields.optional(linkedIn);
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }
}
