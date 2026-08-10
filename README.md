# jsp-hackathon-signup

Registration site for a student hackathon: a team fills in its details, says how many members it has, and the next page grows the right number of member forms. The completed application is written to a text file for the organisers. JSP and Jakarta Servlets on Java 21, packaged as a WAR, no database.

## Features
- A three step flow that keeps its state in the session: team details → member details → confirmation. Nothing is written to disk until the last step succeeds.
- The member form is generated from an earlier answer pick 3 or 4 members on the first page and the second page renders exactly that many blocks of inputs (first name, last name, email, role, LinkedIn).
- A team registers once. After a successful submission the session is flagged, and the landing page, the sign up form and the member form all switch to an "already registered" message instead of offering the form again.
- Each application is written to its own `team_<slug>.txt` file in UTF-8. The file name is a slug derived from the team name lower case, non alphanumerics collapsed to dashes — so no team name, however crafted, can steer the write out of the storage directory.
- Validation lives in the model, not in the servlets: `Team` and `TeamMember` reject blank required fields in their constructors, the team size is accepted only within the advertised 3–4, and a member list that doesn't match the declared size is refused.
- Failure modes answer rather than misbehave: a malformed or out of range team size → 400, a member block posted with fields missing → 400, `/submit-application` reached without a team in the session → redirect back to the form, a repeated submission → redirect to the confirmation.
- Everything rendered comes out through `<c:out>`, so a team named `<script>alert(1)</script>` shows up as text rather than running.
- Form actions are built from `${pageContext.request.contextPath}`, so the app works deployed under any context path, not only at the root.

## Project structure

```
src/main/
├── java/rs/raf/hackathon/
│   ├── model/
│   │   ├── Team.java                    # team details + members; size and field validation
│   │   ├── TeamMember.java              # one person on the team
│   │   └── Fields.java                  # required/optional trimming, shared by both
│   ├── store/ApplicationStore.java      # UTF-8 report per team; slugs the file name
│   └── web/
│       ├── AppContext.java              # ServletContextListener creating the store
│       ├── Session.java                 # the two session attributes, in one place
│       ├── RegisterTeamServlet.java     # POST /register-team       details → session → members.jsp
│       └── SubmitApplicationServlet.java# POST /submit-application  members → file → thank-you.jsp
└── webapp/
    ├── index.jsp                        # landing page: dates, venue, rules, prizes
    ├── register.jsp                     # step 1 — team name, contact, motto, size
    ├── members.jsp                      # step 2 — one form block per member
    ├── thank-you.jsp                    # step 3 — confirmation
    ├── navbar.jsp, styles.jsp           # shared header and stylesheet include
    └── WEB-INF/web.xml                  # http only session cookies, cookie only tracking
```

Dependencies point one way: `web` depends on `model` and `store`; neither of those knows anything about servlets, which is what makes them testable without a container.

## Configuration

| Setting | System property | Environment variable | Default |
| --- | --- | --- | --- |
| Where applications are written | `hackathon.data.dir` | `HACKATHON_DATA_DIR` | `<java.io.tmpdir>/hackathon-applications` |

The system property wins if both are set. The directory is created on first write, and the chosen path is logged at startup.

## Building and running

Maven (with the committed wrapper) handles the build. Nothing needs to be installed beyond a JDK 21.

```bash
./mvnw clean package
```

The Jetty plugin serves the app directly, so no separate Tomcat install is needed:

```bash
HACKATHON_DATA_DIR=./applications ./mvnw jetty:run
```

Then open <http://localhost:8080/>.

To deploy the WAR instead, drop `target/hackathon-signup.war` into any Jakarta EE 10 container (Tomcat 10.1+, Jetty 12 `ee10`). Tomcat 9 and earlier will not run it — the app is on `jakarta.servlet`, not `javax.servlet`.
