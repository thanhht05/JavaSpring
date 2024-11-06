package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.UploadService;
import vn.hoidanit.laptopshop.service.UserService;
import java.util.List;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import java.io.IOException;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;

    }

    // table create new user
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }
    // @PostMapping("/admin/user/create-user")
    // public String createUserPage(Model model,
    // @ModelAttribute("newUser") @Valid User hoidanit,
    // BindingResult newUserBindingResult,
    // @RequestParam("hoidanitFile") MultipartFile file) throws IOException {

    // if(newUserBindingResult.hasErrors()){
    // return"/admin/user/create-user";
    // }
    @PostMapping("/admin/user/create")
    public String createUserPage(Model model, @ModelAttribute("newUser") @Valid User huuthanh,
            BindingResult bindingResult,
            @RequestParam("fileName") MultipartFile file) throws IOException {

        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }
        String avatar = this.uploadService.handleUploadFile(file, "avatar");
        huuthanh.setAvatar(avatar);

        huuthanh.setPassword(this.passwordEncoder.encode(huuthanh.getPassword()));
        String roleName = huuthanh.getRole().getName();
        huuthanh.setRole(this.userService.getRoleByName(roleName));
        huuthanh.setAddress(huuthanh.getAddress());
        huuthanh.setPhone(huuthanh.getPhone());
        huuthanh.setFullName(huuthanh.getFullName());

        this.userService.handlerSaveUser(huuthanh);
        return "redirect:/admin/user";
    }

    // table info user
    @RequestMapping("/admin/user")
    public String getTableUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        model.addAttribute("users", users);
        return "admin/user/table-user";
    }

    @GetMapping("/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        // model.addAttribute("id", id);
        return "admin/user/show";
    }

    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable int id) {
        User user = this.userService.getUserById(id); // lay user by id
        model.addAttribute("user", user); // truyen user qua view
        return "admin/user/update"; // view html update-> lay user tu view truyen vao
    }

    @PostMapping("/admin/user/update")
    public String postUpdate(Model model, @ModelAttribute("newUser") User huuthanh) {
        User user = this.userService.getUserById(huuthanh.getId());
        if (user != null) {
            user.setAddress(huuthanh.getAddress());
            user.setFullName(huuthanh.getFullName());
            user.setPhone(huuthanh.getPhone());

            this.userService.handlerSaveUser(user);
        }
        return "redirect:/admin/user";

    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable int id) {
        model.addAttribute("id", id);
        model.addAttribute("user", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("user") User huuthanh) {
        this.userService.deleteUserById(huuthanh.getId());
        return "redirect:/admin/user";
    }

}
