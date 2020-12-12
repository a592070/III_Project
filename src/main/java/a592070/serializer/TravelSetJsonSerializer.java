package a592070.serializer;

import a592070.pojo.TravelSetDO;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;

public class TravelSetJsonSerializer extends JsonSerializer<TravelSetDO> {
    @Override
    public void serialize(TravelSetDO value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();

        gen.writeObjectFieldStart("info");
        gen.writeNumberField("sn", value.getSn());
//        gen.writeStringField("createdUser", value.getCreatedUser().getUserName());
        gen.writeStringField("createdUser", value.getCreatedUser());
        gen.writeStringField("name", value.getName());
        gen.writeStringField("description", value.getDescription());
        gen.writeNumberField("priority", value.getPriority());
        gen.writeObjectField("createdTime", value.getCreatedTime());
        gen.writeObjectField("updateTime", value.getUpdateTime());
        gen.writeBooleanField("status", value.getStatus());
        gen.writeEndObject();

//        gen.writeObjectFieldStart();
        gen.writeArrayFieldStart("travelEleAttractions");
        value.getTravelAttractions().forEach(ele -> {
            try {
                gen.writeNumberField("sn", ele.getSn());
                gen.writeNumberField("id", ele.getAttraction().getSn());
                gen.writeStringField("name", ele.getAttraction().getName());
                gen.writeObjectField("time", ele.getTime());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        gen.writeEndArray();


        gen.writeArrayFieldStart("travelEleRestaurants");
        value.getTravelRestaurants().forEach(ele -> {
            try {
                gen.writeNumberField("sn", ele.getSn());
                gen.writeNumberField("id", ele.getRestaurant().getSn());
                gen.writeStringField("name", ele.getRestaurant().getName());
                gen.writeObjectField("time", ele.getTime());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        gen.writeEndArray();


        gen.writeArrayFieldStart("travelEleHotels");
        value.getTravelHotels().forEach(ele -> {
            try {
                gen.writeNumberField("sn", ele.getSn());
                gen.writeNumberField("id", ele.getHotel().getSn());
                gen.writeStringField("name", ele.getHotel().getName());
                gen.writeObjectField("time", ele.getTime());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        gen.writeEndArray();


        gen.writeArrayFieldStart("travelEleCars");
        value.getTravelCars().forEach(ele -> {
            try {
                gen.writeNumberField("sn", ele.getSn());
                gen.writeNumberField("id", ele.getCar().getSn());
                gen.writeStringField("name", ele.getCar().getCarType());
                gen.writeObjectField("time", ele.getTime());
            } catch (IOException e) {
                e.printStackTrace();
            }
        });
        gen.writeEndArray();
    }
}
