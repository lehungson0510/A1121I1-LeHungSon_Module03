use quan_li_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *from `subject`
HAVING credit >= ALL (SELECT credit from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select `subject`.* from mark
join `subject` on mark.sub_id = `subject`.sub_id
where mark.mark >= ALL (SELECT mark.mark from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.* , avg(mark) from mark
join student on student.student_id = mark.mark_id
group by student.student_name
order by avg(mark);



