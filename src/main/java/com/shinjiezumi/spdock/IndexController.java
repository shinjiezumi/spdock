package com.shinjiezumi.spdock;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {

    @GetMapping("/")
    public String getIndexPage() {
        return "Hello World.";
    }
}
