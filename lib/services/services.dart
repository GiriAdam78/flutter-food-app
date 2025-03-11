// PAGES
// ignore_for_file: unused_import, unnecessary_import, avoid_web_libraries_in_flutter

import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';

import 'package:flutter/rendering.dart';
import 'package:food_market_app/models/models.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_service.dart';
part 'auth_service.dart';

String baseURL = 'http://foodmarket-backend-video.test/api/';
