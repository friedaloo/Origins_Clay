package com.originsclay.util;

import java.util.regex.Pattern;

/**
 * ValidationUtil - Common input validation helpers.
 *Validation checks".
 */
public class ValidationUtil {

    private static final Pattern EMAIL_PATTERN =
        Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$");

    private static final Pattern PHONE_PATTERN =
        Pattern.compile("^\\+?[0-9]{7,15}$");

    public static boolean isNullOrEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    public static boolean isValidEmail(String email) {
        return !isNullOrEmpty(email) && EMAIL_PATTERN.matcher(email).matches();
    }

    public static boolean isValidPhone(String phone) {
        return !isNullOrEmpty(phone) && PHONE_PATTERN.matcher(phone.replaceAll("[\\s-]", "")).matches();
    }

    /**
     * Password must be at least 8 characters, contain an uppercase letter,
     * a lowercase letter, a digit, and a special character.
     */
    public static boolean isStrongPassword(String password) {
        if (isNullOrEmpty(password) || password.length() < 8) return false;
        boolean hasUpper = false, hasLower = false, hasDigit = false, hasSpecial = false;
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) hasUpper = true;
            else if (Character.isLowerCase(c)) hasLower = true;
            else if (Character.isDigit(c)) hasDigit = true;
            else hasSpecial = true;
        }
        return hasUpper && hasLower && hasDigit && hasSpecial;
    }

    public static boolean isPositiveInteger(String value) {
        if (isNullOrEmpty(value)) return false;
        try {
            return Integer.parseInt(value.trim()) > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public static boolean isValidPrice(String value) {
        if (isNullOrEmpty(value)) return false;
        try {
            return Double.parseDouble(value.trim()) >= 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    private ValidationUtil() {}
}
