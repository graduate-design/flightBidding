package njtech.design.flightBerth.entity.dto;

import lombok.Data;
import njtech.design.flightBerth.entity.Flight;

@Data
public class ShowBidDTO {
    String bidClass ;
    Flight flight;
    Double price;
    int rank;
}
