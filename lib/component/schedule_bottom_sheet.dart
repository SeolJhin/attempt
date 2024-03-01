
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../const/colors.dart';
import 'custom_text_field.dart';
import 'flinger.dart';

const Color  = Colors.blue; // PRIMARY_COLOR를 임의로 정의

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  // 시작 시간과 종료 시간, 내용을 입력받는 컨트롤러들
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 2 +
            bottomInset, // 화면 반 높이에 키보드 높이 추가
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
          child: Column(
            // 시간 관련 텍스트 필드와 내용관련 텍스트 필드 세로로 배치
            children: [
              Row(
                // 시작 시간 종료 시간 가로로 배치
                children: [
                  Expanded(
                    child: CustomTextField(
                      // 시작시간 입력 필드
                      label: '시작 시간',
                      isTime: true,
                      controller: _startTimeController, // 컨트롤러 연결
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      // 종료시간 입력 필드
                      label: '종료 시간',
                      isTime: true,
                      controller: _endTimeController, // 컨트롤러 연결
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: CustomTextField(
                  // 내용 입력 필드
                  label: '내용',
                  isTime: false,
                  controller: _contentController, // 컨트롤러 연결
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  // 저장 버튼, 삭제 버튼, 취소 버튼을 나란히 배치
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        // [저장] 버튼
                        onPressed: () {
                          // 저장 버튼이 눌렸을 때 실행될 함수
                          onSavePressed();
                          // 저장이 완료되었음을 사용자에게 알리기 위해 메시지 표시
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('일정이 저장되었습니다!'),
                              duration: Duration(seconds: 2), // 메시지 표시 시간
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: PRIMARY_COLOR,
                        ),
                        child: Text('저장'),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        // [삭제] 버튼
                        onPressed: onDeletePressed,
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // 빨간색
                        ),
                        child: Text('삭제'),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: ElevatedButton(
                        // [취소] 버튼
                        onPressed: () {
                          // 취소 버튼이 눌렸을 때 이전 화면으로 이동
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey, // 회색
                        ),
                        child: Text('취소'),
                      ),
                    ),
                  ],
                ),
              ),
              // ScheduleCard 추가
              ScheduleCard(
                startTime: int.parse(_startTimeController.text),
                endTime: int.parse(_endTimeController.text),
                content: _contentController.text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {
    // 시작 시간과 종료 시간을 가져오기
    // CustomTextField에서 입력한 값 >> 컨트롤러로
    String startTime = _startTimeController.text;
    String endTime = _endTimeController.text;

    // 내용 가져오기
    String content = _contentController.text;

    // 가져온 데이터 출력
    print('시작 시간: $startTime');
    print('종료 시간: $endTime');
    print('내용: $content');

    // 여기서 데이터를 저장 or 다른 작업 ㄱㄱ
  }

  void onDeletePressed() {
    // 일정 삭제 로직을 여기에 구현
    print('일정 삭제');
  }
}
