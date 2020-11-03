package a592070.pojo;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class AttractionVOJsonSerializer extends JsonSerializer<AttractionVO> {
    @Override
    public void serialize(AttractionVO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeNumberField("sn", value.getSn());
        gen.writeStringField("name", value.getName());
        gen.writeStringField("description", value.getDescription());
        gen.writeStringField("address", value.getAddress());
        gen.writeStringField("picture", value.getPicture());
        gen.writeStringField("ticketInfo", value.getTicketInfo());

        gen.writeEndObject();
    }
}
