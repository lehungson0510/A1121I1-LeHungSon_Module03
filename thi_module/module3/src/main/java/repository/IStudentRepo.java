package repository;

import model.Student;

import java.util.List;

public interface IStudentRepo {
    public List<Student> selectStudent();
}
