package njtech.design.flightBerth.entity.dto;

import lombok.Data;
import njtech.design.flightBerth.entity.Price;

@Data
public class PriceDTO {
    private int rank;
    private int changeRow;
    private Price priceExist;
    private String msg;
}
