/*
 * Copyright 2017 Cedric LE MOIGNE, cedlemo@gmx.com
 * This file is part of OCaml-GObject-Introspection.
 *
 * OCaml-GObject-Introspection is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * OCaml-GObject-Introspection is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with OCaml-GObject-Introspection.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "giunioninfo_stubs.h"

static void
finalize_giunioninfo (value v)
{
    GIUnionInfo *info = NULL;
    info = GIUnionInfo_val (v);

    if (info != NULL)
        g_base_info_unref ((GIBaseInfo *)info);
}

static struct custom_operations giunioninfo_ops = {
    identifier:  "fr.github.cedlemo.gobject-introspection.giunioninfo",
    finalize:    finalize_giunioninfo,
    compare:     custom_compare_default,
    hash:        custom_hash_default,
    serialize:   custom_serialize_default,
    deserialize: custom_deserialize_default
};


value
alloc_giunioninfo (GIUnionInfo *i)
{
    g_base_info_ref ((GIBaseInfo *)i);
    value v = alloc_custom(&giunioninfo_ops, sizeof (GIUnionInfo *), 0, 1);
    GIUnionInfo_val (v) = i;
    return v;
}
