use quan_li_sinh_vien;

SELECT *FROM Student;	

SELECT *FROM Student WHERE Status = true;

SELECT *FROM Subject WHERE Credit < 10; 

-- Join 2 bảng Student và Class
SELECT student.student_id, student.student_name, class.class_name
FROM student  join class  on class.class_id = student.class_id;

-- Sử dụng câu lệnh Where class.class_name ='A1' để hiển thị danh sách học viên lớp A1
SELECT student.student_id, student.student_name, class.class_name
FROM student join class on class.class_id = student.class_id
WHERE class.class_name = 'A1';

-- Hiển thị tất cả các điểm đang có của học viên
SELECT student.student_id,  student.student_name, `subject`.sub_name, mark.mark
FROM student 
join mark on student.student_id = mark.student_id
join `subject` on `subject`.sub_id = mark.sub_id;

-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên
SELECT student.student_id,  student.student_name, `subject`.sub_name, mark.mark
FROM student 
join mark on student.student_id = mark.student_id
join `subject` on `subject`.sub_id = mark.sub_id
where `subject`.sub_name = "CF";

