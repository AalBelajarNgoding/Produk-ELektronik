import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:buat_uts/main.dart';

void main() {
  testWidgets('Produk Elektronik Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app title is rendered.
    expect(find.text('Menu Makanan'), findsOneWidget);

    // Verify that the initial menu items are displayed.
    expect(find.text('Monitor'), findsOneWidget);
    expect(find.text('Mikropon'), findsOneWidget);
    expect(find.text('Headset'), findsOneWidget);
    expect(find.text('TWS'), findsOneWidget);

    // Tap the 'Tambahkan' button for Nasi Goreng
    await tester.tap(find.text('Tambahkan').first);
    await tester.pump();

    // Verify that the cart now contains the added item.
    expect(find.text('Keranjang Produk'), findsOneWidget);
    expect(find.text('Monitor'), findsOneWidget);

    // Tap the 'Tambahkan' button for Es Teh Manis
    await tester.tap(find.text('Tambahkan').at(1));
    await tester.pump();

    // Verify that the cart now contains both items.
    expect(find.text('Keranjang Produk'), findsOneWidget);
    expect(find.text('Monitor'), findsOneWidget);
    expect(find.text('Mikropon'), findsOneWidget);
  });
}

