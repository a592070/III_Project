package a592070.pojo;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class CarVOJsonSerializer extends JsonSerializer<CarVO> {
    @Override
    public void serialize(CarVO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeNumberField("sn", value.getSn());
        gen.writeStringField("name", value.getCarType());
        gen.writeNumberField("price", value.getPrice());
        gen.writeStringField("company", value.getCompany());
        gen.writeEndObject();
    }
}
