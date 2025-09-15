import 'package:crm_app/core/extensions/num_extension.dart';
import 'package:crm_app/core/extensions/string_to_icon.dart';
import 'package:crm_app/core/static/icons.dart';
import 'package:crm_app/core/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CurrentLeadsSection extends StatelessWidget {
  const CurrentLeadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
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
      'name': 'Lead name',
      'status': 'Discussion',
      'description': 'Our goal is to ensure that you have everything you need to build successful...',
      'location': '23/B Kumapara, Sylhet',
      'date': '05 Sep, 2025',
      'time': 'Estimate Time',
      'contact': 'Mohamed Yasser',
      'contactAction': 'Followed up',
      'profileImage': 'https://via.placeholder.com/48',
      'statusColor': Colors.green,
    },
    {
      'name': 'Lead nam',
      'status': 'Discussion',
      'description': 'Our goal is to ensure that you have everything you need to build successful...',
      'location': '23/B Kumapara, Sylhet',
      'date': '05 Sep, 2025',
      'time': 'Estimate Time',
      'contact': 'Mohamed Yasser',
      'contactAction': 'Followed up',
      'profileImage': 'https://via.placeholder.com/48',
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
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with name and status
          Row(
            children: [
              // Status indicator
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(color: leadData['statusColor'], shape: BoxShape.circle),
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
          Text(leadData['description'], style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.4)),

          16.gap,

          // Location
          Row(
            children: [
              AppIcons.locationPinIc.icon(color: Colors.grey[600]),
              8.gap,
              Expanded(
                child: Text(leadData['location'], style: TextStyle(fontSize: 14, color: Colors.grey[600])),
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

              // Action button
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFEF7676), Color(0xFFE92929)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
              ),
            ],
          ),

          16.gap,

          // View Details button
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(12)),
            child: Center(
              child: Text(
                LocaleKeys.view_details.tr(),
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFE92929)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
