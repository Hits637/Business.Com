class CompDetailModel {
  String? organizationName;
  String ownerName;
  String domain;
  String organizationType;
  String establishmentYear;
  String gstinNo;
  String revenue;
  String address;
  String city;
  String state;
  String pitchTextEditingController;
  String descriptionTextEditingController;
  String websiteTextEditingController;
  String partnerRequirment;
  String partnerMinQualification;
  String partnerSkills;
  String compLogo;
  String partnerStakes;
  String mobileNo;

  String? investmentRange;

  CompDetailModel({
    required this.compLogo,
    required this.organizationName,
    required this.ownerName,
    required this.domain,
    required this.organizationType,
    required this.establishmentYear,
    required this.gstinNo,
    required this.revenue,
    required this.address,
    required this.city,
    required this.state,
    required this.pitchTextEditingController,
    required this.descriptionTextEditingController,
    required this.websiteTextEditingController,
    required this.partnerRequirment,
    required this.partnerMinQualification,
    required this.partnerSkills,
    required this.partnerStakes,
    required this.mobileNo,
    this.investmentRange,
  });
}

List<CompDetailModel> compDetailList = [];
List<CompDetailModel> domain1 = [];
List<CompDetailModel> domain2 = [];
List<CompDetailModel> domain3 = [];
List<CompDetailModel> domain4 = [];

Set<String> domainSet = {};

List<List<CompDetailModel>> majorCompDetailModelList =
    List.generate(domainSet.length, (_) => []);

List domainList = domainSet.toList();
bool partner = false;
bool investor = false;
