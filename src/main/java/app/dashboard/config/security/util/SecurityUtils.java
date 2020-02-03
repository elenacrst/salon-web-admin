package app.dashboard.config.security.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class SecurityUtils {
    public static boolean isAuthenticated(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        System.out.println("\nName of logged user = ["+currentPrincipalName+"]");
        return !currentPrincipalName.equals("anonymousUser");
    }

    public static String getAuthenticatedUsername(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        System.out.println("\nName of logged user = ["+currentPrincipalName+"]");
        return currentPrincipalName!=null ? currentPrincipalName :"anonymousUser";
    }
}
