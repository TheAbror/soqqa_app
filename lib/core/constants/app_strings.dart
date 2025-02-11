class AppStrings {
  //Gofur aka
  // static const baseLive = 'http://192.168.1.12:9120/edulab/api/v1/';
  // static const base = 'http://192.168.1.12:9120/edulab/api/v1/';

  //Abduboriy aka
  // static const baseLive = 'http://192.168.1.53:9120/edulab/api/v1/';
  // static const base = 'http://192.168.1.53:9120/edulab/api/v1/';

  //Ismoil
  // static const baseLive = 'http://192.168.1.102:9121/edulab/api/v1/';
  // static const base = 'http://192.168.1.102:9121/edulab/api/v1/';

  static const baseLive = 'https://api.edulab.app/edulab/api/v1/';
  static const base = 'https://api.edulab.app/edulab/api/v1/';

  //All others
  static const mobile = 'mobile';
  static const universityName = 'TEAM';
  static const signIn = 'signin';
  static const userMeInfo = 'user/me/info';
  static const dashboardStudent = 'dashboard/student';
  static const appVersions = '$mobile/settings/versions';
  static const internalErrorMessage = 'Internal error';

  //home page tabs
  static const lessonsAll = 'lesson/all';
  static const academicYearAll = 'academicyear/all';
  static const cclsModule = 'cclsmodule/';
  static const attendance = '$mobile/attendance/table/student';
  static const timetable = '$mobile/timetable/';

  //more tab
  static const postVM = '$mobile/settings/';
  static const videoTutorials = 'video_tutorial/all';

  //notification & Firebase
  static const notifications = 'notification/all';
  static const postFirebaseToken = 'firebase/token/';

  //turnitin
  static const assessment = 'assessment';
  static const assessmentSingle = '$assessment/single';
  static const assessmentWorkUpload = '$assessment/work-upload';
  static const mediaUpload = 'media/upload/react';

  //library
  static const library = '$mobile/e_library/all';
  static const libraryCategoryAll = '$mobile/category/all';
  static const libraryByCategoryID = '$mobile/e_library';

  //staff attendance
  static const staffCCLSModuleAll = 'cclsmodule/all';
  static const staffAttendanceLesson = 'lesson/all?ccls_module_id=';
  static const staffGetGroupsAll = 'group/all';
  static const staffAttendanceMarkStudents = 'attendance/group?group_id=';
  static const submitAttendance = 'attendance/';

  //chat
  static const chatDeatails = 'chat_group/by_component';
  static const chatPost = 'chat_group/';
  static const chatGetAllMessages = 'messages/all';
  static const chatGetAllTopics = 'topics/all';
  static const chatWebSocket = 'ws://192.168.1.102:9121/ws-native';

  static const List<Map<String, dynamic>> policies = [
    {
      'id': 1,
      'title': 'Academic Regulations 2023/2024',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2024/01/17/academic-regulations-23-24_f_305953_s_ntb.pdf',
    },
    {
      'id': 2,
      'title': 'Assessment and Examinations Procedure 2022-23',
      'url':
          'https://www.lsbu.ac.uk/__data/assets/pdf_file/0003/330384/Assessment_and_Examinations_Procedure_2022-23_.pdf',
    },
    {
      'id': 3,
      'title': 'Student Academic Appeals Procedure',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2022/01/18/student_appeals_procedure_f_875718_s_ntb.pdf',
    },
    {
      'id': 4,
      'title': 'Student Complaints Procedure',
      'url':
          'https://www.lsbu.ac.uk/__data/assets/pdf_file/0003/84423/LSBU-Student-Complaints-Procedure-jan-2020.pdf',
    },
    {
      'id': 5,
      'title': 'Student Academic Misconduct Procedure',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2022/01/18/student_academic_misconduct_procedure_f_956372_s_ntb.pdf',
    },
    {
      'id': 6,
      'title': 'Student Extenuating Circumstances Procedure',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2022/01/18/student_extenuating_circumstances_procedure_f_623207_s_ntb.pdf',
    },
    {
      'id': 7,
      'title': 'Enrolment Terms',
      'url':
          'https://www.lsbu.ac.uk/__data/assets/pdf_file/0003/262884/Enrolment-Terms-2020-2021.pdf',
    },
    {
      'id': 8,
      'title': 'Student Interruption and Withdrawal Procedure',
      'url':
          'http://intranet.teamuni.uz/policies/Student_Interruption_and_Withdrawal_Procedure_TEAM.pdf',
    },
    {
      'id': 9,
      'title': 'Data Protection Policy',
      'url':
          'https://www.lsbu.ac.uk/__data/assets/pdf_file/0004/11686/university-data-protection-policy.pdf',
    },
    {
      'id': 10,
      'title': 'Academic Regulations Glossary',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2023/01/05/glossary_2021-2022_-1-_f_282458_s_ntb.pdf',
    },
    {
      'id': 11,
      'title': 'Changing Courses Procedure',
      'url':
          'https://www.lsbu.ac.uk/__data/assets/pdf_file/0009/96255/changing-courses-procedure.pdf',
    },
    {
      'id': 12,
      'title': 'TEAM Merit Based Scholarship',
      'url':
          'https://api.edulab.app/edulab/api/v1/uploads/media/other/2022/08/29/2022-1.pdf',
    },
  ];
}
