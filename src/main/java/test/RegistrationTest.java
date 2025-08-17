package test;

import static org.junit.Assert.*;
import org.junit.Test;
import com.insert.dao.RegisterDao;
import com.insert.model.RegisterBean;

public class RegistrationTest {

	private RegisterDao dao = new RegisterDao();

	@Test
    public void testValidRegistration() {
        RegisterBean user = new RegisterBean();
        user.setName("TestUser");

        // Use random email to guarantee uniqueness
        String randomEmail = "user" + System.currentTimeMillis() + "@gmail.com";
        user.setEmail(randomEmail);

        user.setPassword("12345");

        boolean result = dao.registerUser(user);
        assertTrue("Registration should succeed for valid inputs", result);
    }
}

