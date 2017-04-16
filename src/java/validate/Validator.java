package validate;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author olli
 */
public class Validator {

    // ensures that quantity input is number between 0 and 99
    // applies to quantity fields in cart page
    public boolean validateQuantity (String productId, String quantity) {

        boolean errorFlag = false;

        if (!productId.isEmpty() && !quantity.isEmpty()) {

            int i = -1;

            try {

                i = Integer.parseInt(quantity);
            } catch (NumberFormatException nfe) {

                System.out.println("User did not enter a number in the quantity field");
            }

            if (i < 0 || i > 99) {

                errorFlag = true;
            }
        }

        return errorFlag;
    }


    // performs simple validation on checkout form
    public boolean validateForm(String name,
                                String email,
                                String phohe,
                                String adress,
                                String cityRegion,
                                String ccNumber,
                                HttpServletRequest request) {

        boolean errorFlag = false;
        boolean nameError;
        boolean emailError;
        boolean phoheError;
        boolean adressError;
        boolean cityRegionError;
        boolean ccNumberError;

        if (name == null
                || name.equals("")
                || name.length() > 45) {
            errorFlag = true;
            nameError = true;
            request.setAttribute("nameError", nameError);
        }
        if (email == null
                || email.equals("")
                || !email.contains("@")) {
            errorFlag = true;
            emailError = true;
            request.setAttribute("emailError", emailError);
        }
        if (phohe == null
                || phohe.equals("")
                || phohe.length() < 9) {
            errorFlag = true;
            phoheError = true;
            request.setAttribute("phoheError", phoheError);
        }
        if (adress == null
                || adress.equals("")
                || adress.length() > 45) {
            errorFlag = true;
            adressError = true;
            request.setAttribute("adressError", adressError);
        }
        if (cityRegion == null
                || cityRegion.equals("")
                || cityRegion.length() > 2) {
            errorFlag = true;
            cityRegionError = true;
            request.setAttribute("cityRegionError", cityRegionError);
        }
        if (ccNumber == null
                || ccNumber.equals("")
                || ccNumber.length() > 19) {
            errorFlag = true;
            ccNumberError = true;
            request.setAttribute("ccNumberError", ccNumberError);
        }

        return errorFlag;
    }

}