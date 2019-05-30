package com.epidial.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Arrays;

/**
 * @ CreateDate : Create in 8:20 2019/3/15
 * @ Explain :
 * @ UpdateDate : Update in
 * @ Author : Eestill
 */
@RestController
@RequestMapping(value = "/Form")
public class FormController {

    @RequestMapping(value = "/getdata" , method = RequestMethod.GET)
    public String getCart(HttpServletRequest request, HttpServletResponse response, Model model){
        String[] idStrings=request.getParameterValues("checkbox");
        System.out.println(Arrays.toString(idStrings));
        return "success";
    }
}
