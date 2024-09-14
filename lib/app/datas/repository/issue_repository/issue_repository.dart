import 'package:github_issue_tracker/app/datas/models/issue_data.dart';
import 'package:github_issue_tracker/app/datas/services/api_services.dart';

class IssueRepository {

  final ApiServices apiServices;

  IssueRepository(this.apiServices);


  Future<List<IssueData>?> getIssues(int perPage,int page) async{
    try{
      final response=await apiServices.fetchIssues(perPage, page);
      return response?.map((json) => IssueData.fromJson(json)).toList();

    }catch(e){
      throw Exception("$e");
    }
  }

}