package com.Fed0d.Teamder.controller;


import com.Fed0d.Teamder.Servlets.WrapOfDialog;
import com.Fed0d.Teamder.entity.Dialog;
import com.Fed0d.Teamder.entity.Message;
import com.Fed0d.Teamder.entity.User;
import com.Fed0d.Teamder.repository.DialogRepository;
import com.Fed0d.Teamder.repository.MessageRepository;
import com.Fed0d.Teamder.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class DialogsController {

    @Autowired
    DialogRepository dialogRepository;
    @Autowired
    MessageRepository messageRepository;
    @Autowired
    UserService userService;


    @GetMapping("/dialogs")
    public String dialogs(Map<String,Object> model){
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        List<Dialog> dialogs=dialogRepository.findByUser1_IdOrUser2_Id(user.getId(), user.getId());
        List<WrapOfDialog> wrapOfDialogs=new ArrayList<>();
        Iterator<Dialog> it=dialogs.iterator();
        while (it.hasNext()){
            Dialog dialog=it.next();
            wrapOfDialogs.add(new WrapOfDialog(dialog.getId(),
                    userService.findUserById(dialog.getUser1().getId().equals( user.getId())? dialog.getUser2().getId() : dialog.getUser1().getId()),
                    dialog.getMessage().isEmpty()?null: dialog.getlastMessage()));
        }
        model.put("wrapOfDialogs",wrapOfDialogs);
        return "dialogs";
    }
    @GetMapping("/chat")
    public  String chat(@RequestParam Long id, Map<String, Object> model){
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User interlocutor=userService.findUserById(id);
        Dialog dialog;
        dialog=dialogRepository.findByUser1_IdAndUser2_Id(id,user.getId()).isPresent()?
                dialogRepository.findByUser1_IdAndUser2_Id(id,user.getId()).get() :
                ((dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).isPresent())?
                        (dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).get()):null);
        if(dialog==null){
            dialog=new Dialog();
            dialog.setUser1(user);
            dialog.setUser2(interlocutor);
        }
        dialogRepository.save(dialog);
        Dialog dia=dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).isPresent()?dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).get():dialogRepository.findByUser1_IdAndUser2_Id( id, user.getId()).get();
        model.put("interlocutor", interlocutor);
        model.put("dialog",dia);
        return "chat";
    }
    @PostMapping("/chat")
    public  String postMessage(@RequestParam Long id, @RequestParam String text, Map<String, Object> model){
        User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User interlocutor=userService.findUserById(id);
        text=user.getUsername()+": "+text;
        Dialog dialog=dialogRepository.findByUser1_IdAndUser2_Id(id,user.getId()).isPresent()?
                dialogRepository.findByUser1_IdAndUser2_Id(id,user.getId()).get() :
                ((dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).isPresent())?
                        (dialogRepository.findByUser1_IdAndUser2_Id(user.getId(), id).get()):null);
        if(!dialog.getMessage().isEmpty())
        {dialog.getlastMessage().setRead(true);
        }
        Message message= new Message(text,false, LocalDate.now());
        dialog.addMessage(message);
        messageRepository.save(message);
        dialogRepository.save(dialog);

        /*if(dialog==null){
            dialog=new Dialog();
            dialog.setUser1(user);
            dialog.setUser2(interlocutor);
        }*/
        model.put("interlocutor", interlocutor);
        model.put("dialog",dialog);
        return "redirect:/chat?id="+id;
    }
}
