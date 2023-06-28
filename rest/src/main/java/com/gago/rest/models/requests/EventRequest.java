package com.gago.rest.models.requests;

import com.gago.rest.models.Commessa;
import com.gago.rest.models.Event;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EventRequest {

    private Boolean allDay;
    private String startDate;
    private String endDate;
    private Boolean editable;

    private String commessaKey;

    public Event buildEvent(String userId, Commessa commessa) {
        return Event.builder()
                .allDay(allDay)
                .startDate(startDate)
                .endDate(endDate)
                .editable(editable)
                .userId(userId)
                .commessa(commessa)
                .build();
    }
}
