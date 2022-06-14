package common;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Validation {
    public static boolean checkPhone(String phone) {
        String regPhone1 = "^090\\d{7}$";
        String regPhone2 = "^091\\d{7}$";
        String regPhone3 = "^\\(84\\)\\+90\\d{7}$";
        String regPhone4 = "^\\(84\\)\\+91\\d{7}$";
        return (phone.matches(regPhone1) || phone.matches(regPhone2) || phone.matches(regPhone3) || phone.matches(regPhone4));
    }

    public static boolean checkIdCard(String idCard) {
        String regIdCard1 = "^\\d{9}$";
        String regIdCard2 = "^\\d{12}$";
        return idCard.matches(regIdCard1) || idCard.matches(regIdCard2);
    }

    public static boolean checkDate(String date) {
        String regDate = "^(?:(?:31(/)(?:0?[13578]|1[02]))\\1|(?:(?:29|30)(/)(?:0?[13-9]|1[0-2])\\2))(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$|^(?:29(/)0?2\\3(?:(?:(?:1[6-9]|[2-9]\\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\\d|2[0-8])(/)(?:(?:0?[1-9])|(?:1[0-2]))\\4(?:(?:1[6-9]|[2-9]\\d)?\\d{2})$";
        return date.matches(regDate);
    }

    public static boolean checkEmail(String email) {
        String regEmail = "^[a-z]\\w*@gmail+\\.[a-z]+$";
        return email.matches(regEmail);
    }

    public static boolean checkNumber(int number) {
        return number > 0;
    }

    public static boolean checkNumber(float number) {
        return number > 0;
    }

    public static String formatDate(String date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String dateFormat = LocalDate.parse(date, formatter).format(formatter2);
        return dateFormat;
    }

    public static String formatDateTime(String dateTime) {
        DateTimeFormatter formatterStart = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        DateTimeFormatter formatterEnd = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        return LocalDateTime.parse(dateTime, formatterStart).format(formatterEnd);
    }
}

