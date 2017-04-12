package com.lsm.trip;

import com.lsm.trip.controllers.UserController;
import com.lsm.trip.dto.User;
import com.lsm.trip.mappers.UserMapper;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Arrays;

/**
 * Created by LSM on 2017/2/10.
 */
public class UserTest {
    ClassPathXmlApplicationContext context=new ClassPathXmlApplicationContext("classpath:ApplicationContext.xml");
    @Test
    public void testUserLogin(){
         System.out.println(Arrays.toString(context.getBeanDefinitionNames()));
        UserController userController= context.getBean(UserController.class);
        System.out.println("---"+userController);
    }
}
