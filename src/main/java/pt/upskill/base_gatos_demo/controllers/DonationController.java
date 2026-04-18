package pt.upskill.base_gatos_demo.controllers;


import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
        import org.springframework.web.servlet.view.RedirectView;
import pt.upskill.base_gatos_demo.services.StripeService;

@Controller
@RequestMapping("/donate")
public class DonationController {

    @Autowired
    private StripeService stripeService;

    @PostMapping("/checkout")
    public RedirectView createCheckoutSession(@RequestParam("amount") long amountInCents) throws StripeException {
        Session session = stripeService.createDonationSession(amountInCents);
        return new RedirectView(session.getUrl());
    }

    @GetMapping("/success")
    public String success(@RequestParam("session_id") String sessionId, Model model) {
        model.addAttribute("sessionId", sessionId);
        return "public/donate-success";
    }

    @GetMapping("/cancel")
    public String cancel() {
        return "public/donate-cancel";
    }
}
