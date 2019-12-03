package domain;

public class TaskList {
    private int id;
    private int taskLevel;
    private double taskProduct;
    private int containDay;
    private double taskValue;

    @Override
    public String toString() {
        return "TaskList{" +
                "id=" + id +
                ", taskLevel=" + taskLevel +
                ", taskProduct=" + taskProduct +
                ", containDay=" + containDay +
                ", taskValue=" + taskValue +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTaskLevel() {
        return taskLevel;
    }

    public void setTaskLevel(int taskLevel) {
        this.taskLevel = taskLevel;
    }

    public double getTaskProduct() {
        return taskProduct;
    }

    public void setTaskProduct(double taskProduct) {
        this.taskProduct = taskProduct;
    }

    public int getContainDay() {
        return containDay;
    }

    public void setContainDay(int containDay) {
        this.containDay = containDay;
    }

    public double getTaskValue() {
        return taskValue;
    }

    public void setTaskValue(double taskValue) {
        this.taskValue = taskValue;
    }
}
