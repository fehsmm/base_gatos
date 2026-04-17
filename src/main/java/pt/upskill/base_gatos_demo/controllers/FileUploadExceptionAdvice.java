package pt.upskill.base_gatos_demo.controllers;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class FileUploadExceptionAdvice {

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxSize(MaxUploadSizeExceededException ex, RedirectAttributes redirectAttributes) {
        ex.printStackTrace();
        redirectAttributes.addFlashAttribute("error", "Error: " + ex.getMessage() + " | Cause: " + ex.getRootCause());
        return "redirect:/admin/manage-cat";
    }
}
