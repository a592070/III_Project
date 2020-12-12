package a592070.serializer;

import a592070.pojo.TravelSetDO;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonNode;
import rambo0021.pojo.AccountBean;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TravelSetJsonDeserializer extends JsonDeserializer<TravelSetDO> {
    @Override
    public TravelSetDO deserialize(JsonParser p, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonNode node = p.getCodec().readTree(p);

        TravelSetDO travelSetDO = new TravelSetDO();
        JsonNode info = node.get("info");
        travelSetDO.setSn(info.get("sn").asInt(0));

//        AccountBean accountBean = new AccountBean();
//        accountBean.setUserName(info.get("createdUser").textValue());
//        travelSetDO.setCreatedUser(accountBean);
        travelSetDO.setCreatedUser(info.get("createdUser").textValue());


        travelSetDO.setName(info.get("name").textValue());
        travelSetDO.setDescription(info.get("description").textValue());
        travelSetDO.setPriority(info.get("priority").asInt(0));
        travelSetDO.setCreatedTime(new Date(info.get("createdTime").asLong()));
        travelSetDO.setUpdateTime(new Date(info.get("updateTime").asLong()));


        return null;
    }
}
