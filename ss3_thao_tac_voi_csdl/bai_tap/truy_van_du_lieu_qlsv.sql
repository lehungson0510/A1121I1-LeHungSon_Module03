use quan_li_sinh_vien;

SELECT *FROM student;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *from student 
join class on class.class_id = student.student_id
where student_name like "h%";

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *from class where (month (start_date) = 12);

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *from `subject` where `subject`.credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates =0;

update student set class_id = 2 where student.student_name ="Hung";

select student.student_name,`subject`.sub_name, mark.mark from student
join mark on student.student_id = mark.student_id
join `subject` on mark.sub_id = `subject`.sub_id
order by mark.mark desc;

