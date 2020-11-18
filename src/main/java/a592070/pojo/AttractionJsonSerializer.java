package a592070.pojo;


import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class AttractionJsonSerializer extends JsonSerializer<AttractionDO> {
    @Override
    public void serialize(AttractionDO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeNumberField("sn", value.getSn());
        gen.writeStringField("name", value.getName());
        gen.writeStringField("toldescribe", value.getToldescribe());
        gen.writeStringField("description", value.getDescription());
        gen.writeStringField("tel", value.getTel());
        gen.writeStringField("address", value.getAddress());
        gen.writeNumberField("px", value.getPx());
        gen.writeNumberField("py", value.getPy());
        gen.writeStringField("openTime", value.getOpenTime());
        gen.writeStringField("ticketInfo", value.getTicketInfo());
        gen.writeStringField("travellingInfo", value.getTravellingInfo());
        gen.writeStringField("keywords", value.getKeywords());
        gen.writeStringField("remarks", value.getRemarks());
        gen.writeNumberField("rating", value.getRating());
        gen.writeStringField("region", value.getRegion());
//        gen.writeStringField("pictureUrl", value.getPictureUrl());
        gen.writeBooleanField("status", value.getStatus());

        gen.writeEndObject();
    }
}
