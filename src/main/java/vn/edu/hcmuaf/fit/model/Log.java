package vn.edu.hcmuaf.fit.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

public class Log {
    int id;
    int level;
    String user;
    String src;
    String content;
    Date createAt;
    int status;
    String browerName;
    String locationIpClient;

    static Map<Integer, String> levelMapping = new HashMap<Integer, String>();

    static {
        levelMapping.put(0, "INFO");
        levelMapping.put(1, "AlERT");
        levelMapping.put(2, "WARNING");
        levelMapping.put(3, "DANGER");
        levelMapping.put(4, "ERROR");
    }

    public static int INFO = 0;
    public static int ALERT = 1;
    public static int WARNING = 2;
    public static int DANGER = 3;
    public static int ERROR = 4;


    public Log() {
    }

    public Log(int id, int level, String user, String src, String content, Date createAt, int status) {
        this.id = id;
        this.level = level;
        this.user = user;
        this.src = src;
        this.content = content;
        this.createAt = createAt;
        this.status = status;

    }


    public Log(int level, String user, String src, String content, int status) {
        this.level = level;
        this.user = user;
        this.src = src;
        this.content = content;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getLevel() {
        return level;
    }

    public String getUser() {
        return user;
    }

    public String getSrc() {
        return src;
    }

    public String getContent() {
        return content;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public int getStatus() {
        return status;
    }

    public static Map<Integer, String> getLevelMapping() {
        return levelMapping;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getbrowerName() {
        return browerName;
    }

    public void setbrowerName(String browerName) {
        this.browerName = browerName;
    }

    public String getLocationIpClient() {
        return locationIpClient;
    }

    public void setLocationIpClient(String locationIpClient) {
        this.locationIpClient = locationIpClient;
    }

    public static void setLevelMapping(Map<Integer, String> levelMapping) {
        Log.levelMapping = levelMapping;
    }

    public String getLevelWithName() {
        return levelMapping.get(levelMapping.containsKey(this.level) ? this.level : 0);
    }

    @Override
    public String toString() {
        return "Log{" +
                "id=" + id +
                ", level=" + level +
                ", user='" + user + '\'' +
                ", src='" + src + '\'' +
                ", content='" + content + '\'' +
                ", createAt=" + createAt +
                ", status=" + status +
                '}';
    }
}
