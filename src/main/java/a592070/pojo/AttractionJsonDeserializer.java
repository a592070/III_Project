package a592070.pojo;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;

import java.io.IOException;
import java.math.BigDecimal;


public class AttractionJsonDeserializer extends JsonDeserializer<AttractionDO> {
    /**
     *     private int sn;
     *     private String name;
     *     private String toldescribe;
     *     private String description;
     *     private String tel;
     *     private String address;
     *     private BigDecimal px;
     *     private BigDecimal py;
     *     private String openTime;
     *     private String picture;
     *     private String ticketInfo;
     *     private String travelingInfo;
     *     private String keywords;
     *     private String remarks;
     *     private BigDecimal rating;
     *     private String region;
     */
    @Override
    public AttractionDO deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);

        AttractionDO attractionDO = new AttractionDO();

        attractionDO.setSn(node.get("sn").intValue());

        attractionDO.setName(node.get("name").textValue());
        attractionDO.setToldescribe(node.get("toldescribe").textValue());
        attractionDO.setDescription(node.get("description").textValue());
        attractionDO.setTel(node.get("tel").textValue());
        attractionDO.setAddress(node.get("address").textValue());

        BigDecimal decimal = new BigDecimal(node.get("px").textValue());
        attractionDO.setPx(decimal);
        decimal = new BigDecimal(node.get("py").textValue());
        attractionDO.setPy(decimal);


        attractionDO.setOpenTime(node.get("openTime").textValue());
        attractionDO.setTravellingInfo(node.get("travellingInfo").textValue());
        attractionDO.setTicketInfo(node.get("ticketInfo").textValue());
        attractionDO.setKeywords(node.get("keywords").textValue());
        attractionDO.setRemarks(node.get("remarks").textValue());
        attractionDO.setRegion(node.get("region").textValue());

        if(node.get("rating").textValue() != null) decimal = new BigDecimal(node.get("rating").textValue());
        attractionDO.setRating(decimal);
//        attractionDO.setPictureUrl(node.get("pictureUrl").textValue());
        attractionDO.setStatus(node.get("status").booleanValue());

        return attractionDO;
    }
}
