package config;

import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class EchoHandler extends TextWebSocketHandler {

    private static final Map<String, WebSocketSession> users;

    private static final String USER_ID = "WEBSOCKET_USERID";
    private static final String USER_HTTP_SESSION = "HTTP_SESSION";

    static {
        users = new HashMap<String, WebSocketSession>();
    }

    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

        System.out.println("======成功建立websocket連接======");
        String userId = (String) session.getAttributes().get(USER_ID);
        String userHttpsession = (String) session.getAttributes().get(USER_HTTP_SESSION);
        users.put(userId,session);

        System.out.println("當前在線數:"+users.size());
    }

    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        String userId= (String) session.getAttributes().get(USER_ID);
        System.out.println("用戶"+userId+"已退出");
        users.remove(userId);
        System.out.println("當前在線數:"+users.size());
    }

    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if(session.isOpen()){
            session.close();
        }
        String userId= (String) session.getAttributes().get(USER_ID);
        users.remove(userId);
    }

    public boolean supportsPartialMessages() {
        return false;
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        super.handleTextMessage(session, message);
        System.out.println("from: "+session.getAttributes().get(USER_ID)+" 收到訊息："+message);
        sendMessageToUsers(new TextMessage(message.getPayload()));
    }

    // 全部用戶發送廣播
    public void sendMessageToUsers(TextMessage message) {
        for (String userId : users.keySet()) {
            try {
                if (users.get(userId).isOpen()) {
                    users.get(userId).sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    // 單個用戶發送
    public void sendMessageToUser(String userId, TextMessage message) {
        for (String id : users.keySet()) {
            if (id.equals(userId)) {
                try {
                    if (users.get(id).isOpen()) {
                        users.get(id).sendMessage(message);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
}
