package com.gago.rest.models.requests;

import com.gago.rest.models.Profile;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProfileRequest {

    private String fiscalCode;
    private String address;
    private String city;
    private String postalCode;
    private String birthDate;
    private Integer age;
    private String gender;

    public Profile buildProfile(String userId, String name, String surname, String email) {
        return Profile.builder()
                .userId(userId)
                .name(name)
                .surname(surname)
                .email(email)
                .fiscalCode(fiscalCode)
                .address(address)
                .city(city)
                .postalCode(postalCode)
                .birthDate(birthDate)
                .age(age)
                .gender(gender)
                .build();
    }

}
