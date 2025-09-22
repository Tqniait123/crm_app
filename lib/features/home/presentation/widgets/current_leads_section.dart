import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/extensions/text_style_extension.dart';
import 'package:crm_app/core/extensions/theme_extension.dart';
import 'package:crm_app/core/extensions/widget_extensions.dart';
import 'package:crm_app/core/static/constants.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/theme/colors.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrentLeadsSection extends StatelessWidget {
  final bool withTitle;
  const CurrentLeadsSection({super.key, this.withTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        if (withTitle)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.current_leads.tr(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    LocaleKeys.view_all.tr(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                  ),
                  8.gap,
                  Icon(Icons.help_outline, size: 20, color: Colors.grey[600]),
                ],
              ),
            ],
          ),

        20.gap,

        // Leads list
        ...List.generate(
          2,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: index == 1 ? 0 : 16),
            child: LeadCard(leadData: _mockLeads[index]),
          ),
        ),
      ],
    );
  }

  static final List<Map<String, dynamic>> _mockLeads = [
    {
      'name': 'محمد علي',
      'status': 'مناقشة',
      'description': 'هدفنا هو التأكد من أن لديك كل ما تحتاجه لبناء مشروع ناجح...',
      'location': '١٢ شارع النيل، القاهرة',
      'date': '٠٥ سبتمبر، ٢٠٢٥',
      'time': 'الوقت المتوقع',
      'contact': 'أحمد حسن',
      'contactAction': 'تم المتابعة',
      'profileImage': Constants.placeholderImage,
      'statusColor': Colors.green,
    },
    {
      'name': 'سارة محمود',
      'status': 'جديد',
      'description': 'تم التواصل مع العميل، ونحن في انتظار الرد النهائي...',
      'location': '٤٥ شارع الزيتون، الإسكندرية',
      'date': '١٠ سبتمبر، ٢٠٢٥',
      'time': 'الوقت المتوقع',
      'contact': 'محمود سمير',
      'contactAction': 'تمت الإضافة',
      'profileImage': Constants.placeholderImage,
      'statusColor': Colors.blue,
    },
    {
      'name': 'أحمد صلاح',
      'status': 'متابعة',
      'description': 'تم الاتفاق على عقد اجتماع لمناقشة تفاصيل المشروع...',
      'location': '٣ شارع التحرير، الجيزة',
      'date': '١٢ سبتمبر، ٢٠٢٥',
      'time': '١٢:٠٠ ظهراً',
      'contact': 'منى علي',
      'contactAction': 'تمت المتابعة',
      'profileImage': Constants.placeholderImage,
      'statusColor': Colors.orange,
    },
    {
      'name': 'ليلى سمير',
      'status': 'مغلقة',
      'description': 'تم إغلاق الصفقة بنجاح وتوقيع العقد النهائي مع العميل...',
      'location': '٨ شارع الملك فيصل، أسوان',
      'date': '١٥ سبتمبر، ٢٠٢٥',
      'time': '٣:٠٠ عصراً',
      'contact': 'خالد محمود',
      'contactAction': 'تم الإغلاق',
      'profileImage': Constants.placeholderImage,
      'statusColor': Colors.red,
    },
    {
      'name': 'يوسف كمال',
      'status': 'مناقشة',
      'description': 'العميل مهتم بالخدمة ويحتاج لتفاصيل إضافية قبل اتخاذ القرار...',
      'location': '٢٣ شارع العرب، الأقصر',
      'date': '٢٠ سبتمبر، ٢٠٢٥',
      'time': 'الوقت المتوقع',
      'contact': 'هالة عبد الله',
      'contactAction': 'تم المتابعة',
      'profileImage': Constants.placeholderImage,
      'statusColor': Colors.green,
    },
  ];
}

class LeadCard extends StatelessWidget {
  final Map<String, dynamic> leadData;

  const LeadCard({super.key, required this.leadData});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
        // Updated gradient background to match Figma
        gradient: const LinearGradient(
          begin: Alignment(0.0, -1.0), // Top
          end: Alignment(0.0, 0.68), // 68.7% down
          colors: [
            Color.fromRGBO(254, 205, 205, 0.8), // rgba(254, 205, 205, 0.8)
            Colors.white,
          ],
          stops: [0.0615, 0.687], // 6.15% and 68.7%
        ),
        // White border
        border: Border.all(color: Colors.white, width: 2.4),
        borderRadius: BorderRadius.circular(20), // Updated to match Figma (20px)
        // Updated shadow to match Figma
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(12, 50, 99, 0.14), // rgba(12, 50, 99, 0.14)
            blurRadius: 65,
            offset: const Offset(5, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name and status
          Column(
            children: [
              Row(
                children: [
                  // Status indicator
                  Stack(
                    children: [
                      // Main gradient circle
                      Container(
                        width: 31,
                        height: 31,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(-0.8, -0.8),
                            end: Alignment(0.8, 0.8),
                            colors: [Color(0xFFFE9E9E), Color(0xFFE92929)],
                          ),
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),

                      // User icon
                      Positioned.fill(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [AppIcons.profile.icon(color: Colors.white)],
                          ),
                        ),
                      ),

                      // Status indicator
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Center(
                            child: Container(
                              width: 11,
                              height: 11,
                              decoration: BoxDecoration(
                                color: const Color(0xFF3DB08D),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: const Icon(Icons.check, size: 8, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  12.gap,

                  Expanded(
                    child: Text(
                      leadData['name'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),

                  // Status badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: const Color(0xFFE8F5E8), borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      leadData['status'],
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF2E7D2E)),
                    ),
                  ),
                ],
              ),

              12.gap,

              // Description
              Text(leadData['description'], style: context.bodyMedium.s10.regular.copyWith(color: Colors.grey[600])),

              16.gap,

              // Location
              Row(
                children: [
                  AppIcons.locationPinIc.icon(color: Colors.grey[600]),
                  8.gap,
                  Expanded(
                    child: Text(
                      leadData['location'],
                      style: context.bodyMedium.s10.regular.copyWith(color: Color(0xff2F2109)),
                    ),
                  ),
                ],
              ),

              16.gap,

              // Bottom section with contact info and action button
              Row(
                children: [
                  // Profile image
                  CircleAvatar(radius: 20, backgroundImage: NetworkImage(leadData['profileImage'])),

                  12.gap,

                  // Date and contact info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              leadData['date'],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                            12.gap,
                            Text(
                              leadData['contact'],
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
                            ),
                          ],
                        ),

                        4.gap,

                        Row(
                          children: [
                            Text(leadData['time'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                            12.gap,
                            Text(leadData['contactAction'], style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(20, 20),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
              color: AppColors.primary.withAlpha(70),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.view_details.tr(),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.primary),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFEF7676), Color(0xFFE92929)],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
