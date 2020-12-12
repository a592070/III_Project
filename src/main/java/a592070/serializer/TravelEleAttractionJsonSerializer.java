package a592070.serializer;

import a592070.pojo.TravelEleAttractionDO;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class TravelEleAttractionJsonSerializer extends JsonSerializer<TravelEleAttractionDO> {
    @Override
    public void serialize(TravelEleAttractionDO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeNumberField("sn", value.getSn());


    }
}
