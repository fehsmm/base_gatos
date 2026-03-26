package pt.upskill.base_gatos_demo.models;

import java.time.LocalTime;

public class AddTaskModel {

    private String title;
    private String description;
    private LocalTime time;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }
}
