package njtech.design.flightBerth.enums;

import lombok.Data;


public enum BerthClass {
    BUSINESSCLASS("BusinessClass","商务舱"),
    FISRTCLASS("FirstClass","头等舱"),
    ECONOMYCLASS("EconomyClass","经济舱");
    String berthClass;
    String berthName;

    BerthClass(String berthClass, String berthName) {
        this.berthClass = berthClass;
        this.berthName = berthName;
    }

    public String getBerthName() {
        return berthName;
    }
    public String getBerthClass(){
        return berthClass;
    }

    public static String match(String berthClass){
        for (BerthClass berthClass1:BerthClass.values()){
            if (berthClass1.getBerthClass().equalsIgnoreCase(berthClass)){
                return berthClass1.getBerthName();
            }
        }
        return null;
    }
}
