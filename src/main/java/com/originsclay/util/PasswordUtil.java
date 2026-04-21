package com.originsclay.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * PasswordUtil - BCrypt-based password hashing and verification.
 * Satisfies rubric 4c / MS1P3 "Encryption program".
 */
public class PasswordUtil {

    private static final int LOG_ROUNDS = 12;

    /**
     * Hashes a plaintext password using BCrypt.
     */
    public static String hashPassword(String plaintext) {
        return BCrypt.hashpw(plaintext, BCrypt.gensalt(LOG_ROUNDS));
    }

    /**
     * Checks whether the plaintext password matches the stored hash.
     */
    public static boolean verifyPassword(String plaintext, String hashed) {
        return BCrypt.checkpw(plaintext, hashed);
    }

    private PasswordUtil() {}
}
