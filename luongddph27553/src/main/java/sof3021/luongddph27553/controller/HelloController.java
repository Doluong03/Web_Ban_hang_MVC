package sof3021.luongddph27553.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {
    @RequestMapping("hello")
    public String saySomething(Model model) {
        String name ="DLUOWNG";
        model.addAttribute("name",name);
        return "hello";
    }
}
