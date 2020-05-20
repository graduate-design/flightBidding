package njtech.design.flightBerth.service.impl;

import njtech.design.flightBerth.dao.PriceMapper;
import njtech.design.flightBerth.dao.TicketMapper;
import njtech.design.flightBerth.entity.Flight;
import njtech.design.flightBerth.entity.Price;
import njtech.design.flightBerth.entity.Ticket;
import njtech.design.flightBerth.entity.UserInfo;
import njtech.design.flightBerth.entity.dto.PriceDTO;
import njtech.design.flightBerth.entity.dto.SuccessRank;
import njtech.design.flightBerth.enums.BerthClass;
import njtech.design.flightBerth.enums.TicketRemarkEnum;
import njtech.design.flightBerth.service.PriceService;
import njtech.design.flightBerth.utils.MailUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
public class PriceServiceImpl implements PriceService {

    @Autowired
    private PriceMapper priceMapper;

    @Autowired
    private TicketMapper ticketMapper;

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public PriceDTO insertPrice(String bidClass, int price, Flight flight, UserInfo userInfo) {
        PriceDTO priceDTO = new PriceDTO();
        //查询是否有这个航班这个舱位这个人的竞价记录
        Price firstExist = priceMapper.findPrice(BerthClass.FISRTCLASS.getBerthClass(),flight.getFlightCode(),userInfo.getPhone());
        Price businessExist = priceMapper.findPrice(BerthClass.BUSINESSCLASS.getBerthClass(),flight.getFlightCode(),userInfo.getPhone());
        // todo 在添加之前要校验是否有剩余可竞价舱位
        if (bidClass.equalsIgnoreCase(BerthClass.FISRTCLASS.getBerthClass()) && firstExist!=null && businessExist==null){
                System.out.println("竞价相同舱位");
                priceDTO.setPriceExist(firstExist);
                if (price>firstExist.getPrice()){
                    PriceDTO priceDTO1 = updatePrice(bidClass,price,flight.getFlightCode(),userInfo);
                    priceDTO.setChangeRow(priceDTO1.getChangeRow());
                    priceDTO.setRank(priceDTO1.getRank());
                    priceDTO.setMsg(null);
                    return priceDTO;
                }else {
                    System.out.println("您的竞价需比上次高");
                    priceDTO.setMsg("您的竞价需比上次高");
                    int rank = rank(userInfo.getPhone(),firstExist.getBerthClass(),flight.getFlightCode());
                    priceDTO.setRank(rank);
                    return priceDTO;
                }
        }else if (bidClass.equalsIgnoreCase(BerthClass.FISRTCLASS.getBerthClass()) && firstExist==null && businessExist !=null){
            System.out.println("您存在其他舱位的竞价，如果需要进行本舱位的竞价，请在竞价管理中取消其他舱位的竞价");
            priceDTO.setPriceExist(businessExist);
            int rank = rank(userInfo.getPhone(),businessExist.getBerthClass(),flight.getFlightCode());
            priceDTO.setRank(rank);
            priceDTO.setMsg("您存在其他舱位的竞价，如果需要进行本舱位的竞价，请在竞价管理中取消其他舱位的竞价");
        }else if (bidClass.equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass()) &&  businessExist !=null &&firstExist==null){
            System.out.println("竞价相同舱位");
            priceDTO.setPriceExist(businessExist);
            if (price>firstExist.getPrice()){
                PriceDTO priceDTO1 = updatePrice(bidClass,price,flight.getFlightCode(),userInfo);
                priceDTO.setChangeRow(priceDTO1.getChangeRow());
                priceDTO.setRank(priceDTO1.getRank());
                priceDTO.setMsg(null);
                return priceDTO;
            }else {
                System.out.println("您的竞价需比上次高");
                priceDTO.setMsg("您的竞价需比上次高");
                int rank = rank(userInfo.getPhone(),firstExist.getBerthClass(),flight.getFlightCode());
                priceDTO.setRank(rank);
                return priceDTO;
            }

        }else if (bidClass.equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass()) &&  businessExist ==null &&firstExist!=null){

            System.out.println("您存在其他舱位的竞价，如果需要进行本舱位的竞价，请在竞价管理中取消其他舱位的竞价");
            priceDTO.setPriceExist(firstExist);
            int rank = rank(userInfo.getPhone(),firstExist.getBerthClass(),flight.getFlightCode());
            priceDTO.setRank(rank);
            priceDTO.setMsg("您存在其他舱位的竞价，如果需要进行本舱位的竞价，请在竞价管理中取消其他舱位的竞价");


        } else  if (firstExist==null && businessExist ==null){
            //都没数据
            //没有之前的记录的
            Date date = new Date();
            //设置priceCode
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
            String dateStr = sdf.format(date);
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append("PRICE");
            stringBuffer.append(dateStr);
            stringBuffer.append(userInfo.getId());

            Price priceObj = new Price();
            priceObj.setPriceCode(stringBuffer.toString());
            priceObj.setBerthClass(bidClass);
            priceObj.setFlightCode(flight.getFlightCode());
            priceObj.setPrice((double) price);
            priceObj.setUserCode(userInfo.getPhone());
            priceObj.setUserName(userInfo.getUserName());
            priceObj.setCreateTime(date);
            priceObj.setDelFlag((byte)0);
            int count = priceMapper.insertPrice(priceObj);
            int rank = rank(userInfo.getPhone(),bidClass,flight.getFlightCode());
            priceDTO.setChangeRow(count);
            priceDTO.setRank(rank);
        }

        return priceDTO;
    }

    @Override
    public int rank(String phone,String bidClass,String flightCode) {
        int rank = priceMapper.rank(phone,bidClass,flightCode);
        return rank;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public PriceDTO updatePrice(String bidClass, int price, String flightCode, UserInfo userInfo) {
        PriceDTO priceDTO = new PriceDTO();
//        Price priceExist = priceMapper.findPrice(bidClass,flightCode,userInfo.getPhone());
//        priceDTO.setPriceExist(priceExist);

        Date date = new Date();
        int row = priceMapper.updatePrice(bidClass,price,flightCode,date,userInfo.getPhone());

        int rank = rank(userInfo.getPhone(),bidClass,flightCode);

        priceDTO.setRank(rank);
        priceDTO.setChangeRow(row);
        return priceDTO;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public void getEventualRank(Flight flights) {
        //找到price里面对应航班的排名 根据flightCode 和对应竞价舱位得到最终成功的用户列表
        //头等舱 FirstClass
        List<SuccessRank> firstRanks = priceMapper.getEventualRank(flights.getFlightCode(), BerthClass.FISRTCLASS.getBerthClass());
        if (!CollectionUtils.isEmpty(firstRanks)){
            expireTicket(firstRanks,flights,BerthClass.FISRTCLASS.getBerthClass());

        }

        //商务舱
        List<SuccessRank> businessRanks = priceMapper.getEventualRank(flights.getFlightCode(),BerthClass.BUSINESSCLASS.getBerthClass());
        if (!CollectionUtils.isEmpty(businessRanks)){
            expireTicket(businessRanks,flights,BerthClass.FISRTCLASS.getBerthClass());

        }

    }



    public void expireTicket( List<SuccessRank> successRanks,Flight flight,String berthClass){
        int min = 0 ;
        int redundantSize = 0 ;
        if (BerthClass.FISRTCLASS.getBerthClass().equals(berthClass)){
            redundantSize = flight.getRedundantFirstClass();
        }
        if (BerthClass.BUSINESSCLASS.getBerthClass().equals(berthClass)){
            redundantSize = flight.getRedundantBusinessClass();
        }
        min = redundantSize>successRanks.size()?successRanks.size():redundantSize;

        for ( int i = 0 ;i<min;i++){
            SuccessRank successRank = successRanks.get(i);
            // TODO 调用发送邮件的接口
            try {
                MailUtils.sendMail(successRank.getEmail(),null,successRank.getFlightNum(),BerthClass.match(successRank.getBidClass()),successRank.getPrice());
            } catch (Exception e) {
                e.printStackTrace();
            }


            //todo 支付成功接口
            int rd=Math.random()>0.5?1:0;


            Ticket ticket = ticketMapper.getFlightAndTicket(successRank.getIdentity(),successRank.getFlightNum(),
                    flight.getStartPlace(),flight.getTargetPlace(),successRank.getFlightDate(),TicketRemarkEnum.BIDDING.getRemark());
            if (rd==1){
                //支付成功
                System.out.println(successRank.getPhone()+"用户支付成功");
                //将这些最终成功的购票信息给新增升舱后的记录
                Ticket ticket1 = new Ticket();
                //原来的购票记录 已升舱
                ticket.setRemark(TicketRemarkEnum.SUCCESS.getRemark());
                ticketMapper.updateTicketRemarkById(ticket.getId(),ticket.getRemark());

                BeanUtils.copyProperties(ticket,ticket1);

                Date date = new Date();
                //设置priceCode
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String dateStr = sdf.format(date);
                StringBuffer stringBuffer = new StringBuffer();
                stringBuffer.append("TICKET");
                stringBuffer.append(dateStr);
                stringBuffer.append(ticket.getId());
                ticket1.setTicCode(stringBuffer.toString());
                if (successRank.getBidClass().equalsIgnoreCase(BerthClass.FISRTCLASS.getBerthClass())){
                    ticket1.setBerthName(BerthClass.FISRTCLASS.getBerthName());
                }else if (successRank.getBidClass().equalsIgnoreCase(BerthClass.BUSINESSCLASS.getBerthClass())){
                    ticket1.setBerthName(BerthClass.BUSINESSCLASS.getBerthName());
                }
                //新增的机票记录是 升舱后
                ticket1.setRemark(TicketRemarkEnum.SUCCEED.getRemark());
                ticketMapper.insertTicket(ticket1);

                Price price = new Price();
                price.setId(successRank.getId());
                price.setRemark(TicketRemarkEnum.SUCCESS.getRemark());
                price.setDelFlag((byte)1);
                priceMapper.updatePriceRemarkDelFlag(price);

            }else {
                //下一个 放弃支付 或 支付失败
                System.out.println(successRank.getPhone()+"用户支付失败");
                ticket.setRemark(TicketRemarkEnum.EXPIRED.getRemark());
                ticketMapper.updateTicketRemarkById(ticket.getId(),ticket.getRemark());
                Price price = new Price();
                price.setId(successRank.getId());
                price.setDelFlag((byte)1);
                price.setRemark(TicketRemarkEnum.EXPIRED.getRemark());
                priceMapper.updatePriceRemarkDelFlag(price);

                //这个不成功换下一个竞价用户
                if (redundantSize+1<successRanks.size()){
                    min = min+1;
                }
            }
        }

    }
    @Override
    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public int removePrice(Flight flight, UserInfo userInfo) {
        int row = priceMapper.removePrice(flight.getFlightCode(),userInfo.getPhone(),userInfo.getUserName());
        return row;
    }

    @Override
    public PriceDTO findPriceAndRank(String phone, String flightCode) {
        Price price = priceMapper.findPrice(null,flightCode,phone);
        int rank = priceMapper.rank(phone,price.getBerthClass(),flightCode);

        PriceDTO priceDTO = new PriceDTO();
        priceDTO.setRank(rank);
        priceDTO.setPriceExist(price);

        return priceDTO;
    }
}
