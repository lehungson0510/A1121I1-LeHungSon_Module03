use quan_li_sinh_vien;

-- Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select student.address, count(student_id) as "Số lượng học viên" from student
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select student.student_id, student.student_name, mark
from student 
left join mark on student.student_id = mark.student_id
group by student_name,student_id;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
-- Đầu tiên hiển thị điểm trung bình các môn học của mỗi học viên
select student.student_id, student.student_name, avg(mark) as diem_trung_binh
from student 
join mark on student.student_id = mark.student_id
group by student_id
having diem_trung_binh < 15;

 -- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
 select student.student_id, student.student_name, avg(mark) as diem_trung_binh
from student 
join mark on student.student_id = mark.student_id
group by student_id
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.Student_id);


