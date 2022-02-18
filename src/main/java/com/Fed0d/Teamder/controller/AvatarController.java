package com.Fed0d.Teamder.controller;

import com.Fed0d.Teamder.entity.Avatar;
import com.Fed0d.Teamder.repository.AvatarRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class AvatarController {
    private final AvatarRepository avatarRepository;

    @GetMapping("/avatars/{id}")
    private ResponseEntity<?> getAvatarById(@PathVariable Long id){
        Avatar image = avatarRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", image.getOriginalFileName())
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
    }
}
