package com.example.tourfirm.controllers;

import com.example.tourfirm.models.Role;
import com.example.tourfirm.models.User;
import com.example.tourfirm.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;


    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping
    public String admin(Model model) {
        return "admin";
    }

    @GetMapping("/profile")
    public String profile(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
       model.addAttribute("user", user);
        return "profile";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/users")
    public String userList(Model model) {
        model.addAttribute("users", userService.list());
        return "user-list";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/users/{user}")
    public String userEditForm(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit-admin";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/users/editadmin")
    public String userSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.userEdit(username, form, user);

        return "redirect:/users";
    }


    @PostMapping("/users/edit")
    public String userSave(
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user
    ) {
        userService.userEdit(form, user);

        return "redirect:/profile";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/users/put")
    public String userSave(
                           @RequestParam("fullname") String fullname,
                           @RequestParam("userId") User user
    ) {
        //userService.userEdit(fullname, user);
        System.out.println(fullname);

        return "redirect:/";
    }

}
