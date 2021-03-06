/**
 * SHA224Test
 *
 * A test class for SHA224
 * Copyright (c) 2007 Henri Torgemane
 *
 * See LICENSE.txt for full license information.
 */
package com.hurlant.tests.crypto.hash;


import com.hurlant.tests.*;

import com.hurlant.crypto.hash.SHA224;
import com.hurlant.util.Hex;

import com.hurlant.util.ByteArray;

class SHA224Test extends BaseTestCase {
    /**
     * Test vectors courtesy of
     * http://www.ietf.org/rfc/rfc3874.txt
     */
    public function test_sha224() {
        var srcs = [
            Hex.fromString("abc"),
            Hex.fromString("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq")
        ];
        var hashes = [
            "23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7",
            "75388b16512776cc5dba5da1fd890150b0c6455cb4f58b1952522525"
        ];

        var sha224 = new SHA224();
        for (i in 0...srcs.length) {
            var src = Hex.toArray(srcs[i]);
            var digest = sha224.hash(src);
            assert(Hex.fromArray(digest), hashes[i]);
        }
    }

    public function test_longSha224() {
        var src = new ByteArray();
        src.length = Std.int(1000000);
        var a = "a".charCodeAt(0);
        for (i in 0...src.length) src[i] = a;
        var sha224 = new SHA224();
        var digest = sha224.hash(src);
        var hash = "20794655980c91d8bbb4c1ea97618a4bf03f42581948b2ee4ee7ad67";
        assert(Hex.fromArray(digest), hash);
    }
}


