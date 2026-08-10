package rs.raf.hackathon.web;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import rs.raf.hackathon.store.ApplicationStore;

@WebListener
public class AppContext implements ServletContextListener {

    private static final String STORE = "applicationStore";

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ApplicationStore store = ApplicationStore.fromEnvironment();
        event.getServletContext().setAttribute(STORE, store);
        event.getServletContext().log("Applications will be written to " + store.directory().toAbsolutePath());
    }

    public static ApplicationStore store(ServletContext context) {
        return (ApplicationStore) context.getAttribute(STORE);
    }
}
