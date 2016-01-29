module ApplicationHelper
  def course_subject_status course_subjects, subject
    case course_subjects.find_by(subject_id: subject.id).status
    when "active"
      "<span class='label label-primary'>#{t("course.active")}</span>"
    when "inactive"
      "<span class='label label-default'>#{t("course.inactive")}</span>"
    else
      "<span class='label label-warning'>#{t("course.finish")}</span>"
    end
  end
end
