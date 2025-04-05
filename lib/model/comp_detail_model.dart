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

bool partner = false;
bool investor = false;
